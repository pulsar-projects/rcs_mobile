enum RecycledItemStatus {
  OPEN,
  CLOSED,
  DEFAULT,
}

extension RecycledItemStatusExtension on RecycledItemStatus {
  String toShortString() {
    return this.toString().split('.').last;
  }

  // ignore: missing_return
  String get description {
    switch (this) {
      case RecycledItemStatus.OPEN:
        return 'Recycle planned ';
        break;
      case RecycledItemStatus.CLOSED:
        return 'Recycle completed';
        break;
      case RecycledItemStatus.DEFAULT:
        return 'Item to be recycled';
        break;
    }
  }
}