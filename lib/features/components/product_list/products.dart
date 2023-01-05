import 'package:data_config/data_config.dart';
import 'package:tekction/data/model/mode.dart';

final List<ItemProduct> products = [
  ItemProduct(
    id: '123456',
    label: 'bbc',
    description: 'Good on condition',
    price: 45,
    img: 'https://picsum.photos/200/300.jpg',
    qte: 2,
    sold: 1,
    brand: '',
    ownerId: '',
    addressId: '',
    tagId: '',
    count: 1,
    tag: Tag(
      id: '',
      name: 'good',
      description: '',
      img: '',
      ref: '',
      status: 1,
      createdAt: '',
    ),
    address: Address(
      id: '',
      status: 1,
      name: '',
      lat: 1.1,
      lng: 1.1,
      description: '',
      city: '',
      zipCode: '',
      createdAt: '',
      userId: '',
    ),
    currency: 'NPR',
    symbol: 'T',
    shipping: true,
    collect: true,
    stocks: [],
  ),
  ItemProduct(
    id: '123',
    label: 'asd',
    description: '',
    price: 11.1,
    img: 'https://picsum.photos/200/300.jpg',
    qte: 5,
    sold: 1,
    brand: '',
    ownerId: '',
    addressId: '',
    tagId: '',
    count: 4,
    tag: Tag(
      id: '',
      name: 'big',
      description: 'very very big',
      img: rawImage,
      ref: '',
      status: 1,
      createdAt: '',
    ),
    address: Address(
      id: '',
      status: 1,
      name: '',
      lat: 1.1,
      lng: 1.1,
      description: '',
      city: '',
      zipCode: '',
      createdAt: '',
      userId: '',
    ),
    currency: 'NPR',
    symbol: 'T',
    shipping: true,
    collect: true,
    stocks: [
      StockItem(
        id: '',
        qte: 4,
        sold: 1,
        sizeId: '',
        productId: '',
        name: '',
        size: SizeItem(
          id: '89',
          name: 'L',
          description: '',
          status: 1,
          createdAt: '',
        ),
        select: true,
      ),
      StockItem(
        id: '',
        qte: 4,
        sold: 1,
        sizeId: '',
        productId: '',
        name: '',
        size: SizeItem(
          id: '89',
          name: 'XL',
          description: '',
          status: 1,
          createdAt: '',
        ),
        select: true,
      ),
    ],
  ),
  ItemProduct(
    id: '123456',
    label: 'bbc',
    description: 'Good on condition',
    price: 45,
    img: 'https://picsum.photos/200/300.jpg',
    qte: 2,
    sold: 1,
    brand: '',
    ownerId: '',
    addressId: '',
    tagId: '',
    count: 1,
    tag: Tag(
      id: '',
      name: 'good',
      description: '',
      img: '',
      ref: '',
      status: 1,
      createdAt: '',
    ),
    address: Address(
      id: '',
      status: 1,
      name: '',
      lat: 1.1,
      lng: 1.1,
      description: '',
      city: '',
      zipCode: '',
      createdAt: '',
      userId: '',
    ),
    currency: 'NPR',
    symbol: 'T',
    shipping: true,
    collect: true,
    stocks: [],
  ),
  ItemProduct(
    id: '123',
    label: 'asd',
    description: '',
    price: 11.1,
    img: 'https://picsum.photos/200/300.jpg',
    qte: 5,
    sold: 1,
    brand: '',
    ownerId: '',
    addressId: '',
    tagId: '',
    count: 4,
    tag: Tag(
      id: '',
      name: 'big',
      description: 'very very big',
      img: rawImage,
      ref: '',
      status: 1,
      createdAt: '',
    ),
    address: Address(
      id: '',
      status: 1,
      name: '',
      lat: 1.1,
      lng: 1.1,
      description: '',
      city: '',
      zipCode: '',
      createdAt: '',
      userId: '',
    ),
    currency: 'NPR',
    symbol: 'T',
    shipping: true,
    collect: true,
    stocks: [
      StockItem(
        id: '',
        qte: 4,
        sold: 1,
        sizeId: '',
        productId: '',
        name: '',
        size: SizeItem(
          id: '89',
          name: 'L',
          description: '',
          status: 1,
          createdAt: '',
        ),
        select: true,
      ),
      StockItem(
        id: '',
        qte: 4,
        sold: 1,
        sizeId: '',
        productId: '',
        name: '',
        size: SizeItem(
          id: '89',
          name: 'XL',
          description: '',
          status: 1,
          createdAt: '',
        ),
        select: true,
      ),
    ],
  ),
];