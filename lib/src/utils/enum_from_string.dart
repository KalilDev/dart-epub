T? enumFromString<T extends Enum>(List<T> enumValues, String s) =>
    enumValues.cast<T?>().singleWhere(
          (e) => e!.name == s,
          orElse: () => null,
        );
