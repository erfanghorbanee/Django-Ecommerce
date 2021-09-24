from rest_framework.decorators import api_view
from django_ecommerce.pagination import CustomPagination
from products.models import Product, Category
from .serializers import ProductSerializer


@api_view(['GET', ])
def product_list_view(request):
    paginator = CustomPagination()
    query_set = Product.objects.all()
    context = paginator.paginate_queryset(query_set, request)
    serializer = ProductSerializer(context, many=True)
    return paginator.get_paginated_response(serializer.data)
