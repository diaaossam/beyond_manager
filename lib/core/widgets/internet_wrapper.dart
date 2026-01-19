import 'dart:async';
import 'package:bond/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import '../../config/dependencies/injectable_dependencies.dart';
import '../services/network/internet_checker/connectivity_helper.dart';
import 'no_internet_screen.dart';

/// Wrapper widget that listens to internet connectivity
/// and shows NoInternetScreen when disconnected
class InternetWrapper extends StatefulWidget {
  final Widget child;

  const InternetWrapper({super.key, required this.child});

  @override
  State<InternetWrapper> createState() => _InternetWrapperState();
}

class _InternetWrapperState extends State<InternetWrapper>
    with WidgetsBindingObserver {
  late final ConnectivityHelper _connectivityHelper;
  StreamSubscription<bool>? _connectivitySubscription;
  bool _isConnected = true;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _connectivityHelper = sl<ConnectivityHelper>();
    _initConnectivity();
    _listenToConnectivity();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _connectivitySubscription?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkCurrentConnectivity();
    }
  }

  /// Initialize connectivity check
  Future<void> _initConnectivity() async {
    try {
      final isConnected = await _connectivityHelper.checkConnectivity();
      if (mounted) {
        setState(() {
          _isConnected = isConnected;
          _isInitialized = true;
        });
      }
    } catch (e) {
      debugPrint('Error checking initial connectivity: $e');
      if (mounted) {
        setState(() {
          _isConnected = true; // Assume connected on error
          _isInitialized = true;
        });
      }
    }
  }

  /// Listen to connectivity changes
  void _listenToConnectivity() {
    _connectivitySubscription = _connectivityHelper
        .getConnectivityStream()
        .listen(
          (isConnected) {
            if (mounted && _isConnected != isConnected) {
              setState(() {
                _isConnected = isConnected;
              });

              // Show snackbar on connectivity change
              _showConnectivitySnackBar(isConnected);
            }
          },
          onError: (error) {
            debugPrint('Error in connectivity stream: $error');
          },
        );
  }

  /// Check current connectivity status
  Future<void> _checkCurrentConnectivity() async {
    try {
      final isConnected = await _connectivityHelper.checkConnectivity();
      if (mounted && _isConnected != isConnected) {
        setState(() => _isConnected = isConnected);
      }
    } catch (e) {
      debugPrint('Error checking connectivity: $e');
    }
  }

  /// Show connectivity status snackbar
  void _showConnectivitySnackBar(bool isConnected) {
    final context = this.context;
    if (!mounted) return;

    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(
            isConnected ? Icons.wifi_rounded : Icons.wifi_off_rounded,
            color: Colors.white,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              isConnected ? 'تم الاتصال بالإنترنت' : 'انقطع الاتصال بالإنترنت',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: isConnected ? Colors.green : Colors.red,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(16),
    );

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// Handle retry button press
  Future<void> _handleRetry() async {
    await _checkCurrentConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Scaffold(body: Center(child: LoadingWidget()));
    }

    // Show no internet screen if disconnected
    if (!_isConnected) {
      return NoInternetScreen(onRetry: _handleRetry);
    }

    // Show child widget if connected
    return widget.child;
  }
}
