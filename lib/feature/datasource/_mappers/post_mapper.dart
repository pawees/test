class PostsMapper {

  static Items fromDTO(ItemsResponse dto, [itemData]) {
    return Items(
      title: dto.title,
      description: dto.description,
      previewImg: itemData,
      id: dto.id,
      category: dto.category.toCategory,
    );
  }

}

class PostDetailsMapper {
  static Items fromDTO(ItemsResponse dto, [itemData]) {
    return Items(
      imageUrl: '',
      description: dto.description,
      previewImg: itemData,
      id: dto.id,
      comments: dto.category.toCategory,
    );
  }

}