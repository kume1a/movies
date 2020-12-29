import 'package:flutter/material.dart';

typedef ItemBuilder<T> = Widget Function(BuildContext, T);
typedef WidgetCallback = void Function(BuildContext);
enum ListType { sliverBuilder, builder }

class PagedList<T> extends StatelessWidget {
  final Axis axis;
  final ListType listType;
  final int extent;

  final WidgetCallback request;
  final WidgetBuilder blankBuilder;
  final ItemBuilder<T> itemBuilder;
  final List<T> items;
  final int totalCount;
  final int totalPages;

  const PagedList({
    this.axis = Axis.vertical,
    this.listType = ListType.builder,
    this.extent = 4,
    @required this.request,
    @required this.blankBuilder,
    @required this.itemBuilder,
    @required this.items,
    @required this.totalCount,
    @required this.totalPages,
  });

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    if (totalCount == 0) {
      switch (listType) {
        case ListType.sliverBuilder:
          return const SliverToBoxAdapter();
        case ListType.builder:
          return const SizedBox.shrink();
      }
    }

    final int length = items.length;
    final int itemCount = totalCount == length ? length : length + extent;
    switch (listType) {
      case ListType.sliverBuilder:
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            _itemBuilder,
            childCount: itemCount,
          ),
        );
      case ListType.builder:
        return ListView.builder(
          itemCount: itemCount,
          scrollDirection: axis,
          itemBuilder: _itemBuilder,
        );
    }
  }

  Widget _itemBuilder(BuildContext context, int index) {
    if (index >= items.length) {
      request.call(context);
      return blankBuilder.call(context);
    }
    return itemBuilder.call(context, items[index]);
  }
}
