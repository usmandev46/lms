import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PaginationWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final int maxVisible;
  final bool isLoading;
  final ValueChanged<int> onPageChange;

  const PaginationWidget({
    super.key,
    required this.isLoading,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChange,
    this.maxVisible = 4,
  });

  @override
  Widget build(BuildContext context) {
    if (totalPages <= 1) return const SizedBox();

    int start = (currentPage - 2).clamp(1, totalPages);
    int end = (start + maxVisible - 1).clamp(1, totalPages);

    if (end - start < maxVisible - 1) {
      start = (end - maxVisible + 1).clamp(1, totalPages);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: currentPage > 1
              ? () =>  onPageChange(currentPage - 1)
              : null,
        ),

        if (start > 1)
          _pageButton(context, 1),

        if (start > 2)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Text("..."),
          ),

        for (int p = start; p <= end; p++)
          _pageButton(context, p),

        if (end < totalPages - 1)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Text("..."),
          ),

        if (end < totalPages)
          _pageButton(context, totalPages),

        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: currentPage < totalPages
              ? () => onPageChange(currentPage + 1)
              : null,
        ),
      ],
    );
  }

  Widget _pageButton(BuildContext context, int page) {
    final isActive = currentPage == page;

    return GestureDetector(
      onTap: isLoading ? null : () => onPageChange(page),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: isActive
              ? Theme.of(context).colorScheme.primary
              : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          "$page",
          style: TextStyle(
            fontSize: 12.2.sp,
            color: isActive ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
