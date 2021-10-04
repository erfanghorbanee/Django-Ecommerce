from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from customers.models import DiscountCode
from .serializers import DiscountCodeSerializer


@api_view(['GET', ])
def discount_code_view(request):
    query_set = DiscountCode.objects.all()

    code = request.query_params.get('code')
    if code is not None:
        query_set = query_set.filter(code=code)

    serializer = DiscountCodeSerializer(query_set, many=True)

    return Response(serializer.data, status=status.HTTP_200_OK)

    # return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
