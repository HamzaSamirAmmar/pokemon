enum ProductCardSize {
  large, // 242 height, 160 width,
  medium, // 160 height, 110 width,
  small // 160 height, 105 width,
}

Map<ProductCardSize, Map<String, double>> productCardDimensions = {
  ProductCardSize.large: {"h": 242, "w": 160},
  ProductCardSize.medium: {"h": 160, "w": 110},
  ProductCardSize.small: {"h": 160, "w": 105}
};
