import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../../core/utils/app_size.dart';
import '../../../../../../widgets/custom_search_text_form_field.dart';

class MemberSearchBar extends StatelessWidget {
  final void Function(String? value, SearchType type) onSearch;

  const MemberSearchBar({
    super.key,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.screenWidth * .04,
      ),
      child: Row(
        children: [
          Expanded(
            child: _SearchField(
              hintText: context.localizations.name,
              onSearch: (value) => onSearch(value, SearchType.name),
            ),
          ),
          SizedBox(width: SizeConfig.screenWidth * .02),
          Expanded(
            child: _SearchField(
              hintText: context.localizations.insuranceID,
              onSearch: (value) => onSearch(value, SearchType.insuranceId),
            ),
          ),
          SizedBox(width: SizeConfig.screenWidth * .02),
          Expanded(
            child: _SearchField(
              hintText: context.localizations.staffId,
              onSearch: (value) => onSearch(value, SearchType.staffId),
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchField extends StatefulWidget {
  final String hintText;
  final void Function(String? value) onSearch;

  const _SearchField({
    required this.hintText,
    required this.onSearch,
  });

  @override
  State<_SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<_SearchField> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onChanged(String? value) {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }
    _debounce = Timer(
      const Duration(milliseconds: 800),
      () => widget.onSearch(value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomSearchTextFormField(
      hintText: widget.hintText,
      onChange: _onChanged,
    );
  }
}

enum SearchType { name, insuranceId, staffId }
