from rest_framework import serializers
from products.models import Product,ProductImage


class ProductImageSerializer(serializers.ModelSerializer):

    class Meta:
        model = ProductImage
        fields = ['id', 'name', 'image', ]


class ProductSerializer(serializers.ModelSerializer):
    image = ProductImageSerializer(read_only=True, many=True)

    class Meta:
        model = Product
        fields = ['id', 'title', 'price', 'seller', 'rate', 'description', 'status', 'category', 'image', ]
