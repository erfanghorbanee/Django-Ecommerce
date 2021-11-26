from rest_framework import serializers
from products.models import Product, ProductImage, Category


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['title']


class ProductImageSerializer(serializers.ModelSerializer):

    class Meta:
        model = ProductImage
        fields = ['id', 'name', 'image', ]


class ProductSerializer(serializers.ModelSerializer):
    image = ProductImageSerializer(read_only=True, many=True)
    category = serializers.CharField(source='category.title')

    class Meta:
        model = Product
        fields = '__all__'
