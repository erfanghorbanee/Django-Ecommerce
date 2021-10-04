from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from customers.models import DiscountCode
from .serializers import DiscountCodeSerializer
from datetime import datetime

import pytz
utc = pytz.UTC


@api_view(['GET', ])
def discount_code_view(request):
    code = request.query_params.get('code')
    if code is not None:
        query_set = DiscountCode.objects.all().filter(user=request.user, code=code)

        serializer = DiscountCodeSerializer(query_set, many=True)

        # check if query_set is not empty.
        if query_set:
            # check if discount code has expired.
            if utc.localize(datetime.now()) > query_set.first().expire_date:
                return Response({"error": "Sorry, your discount code has expired!"},
                                status=status.HTTP_406_NOT_ACCEPTABLE)

        return Response(serializer.data, status=status.HTTP_200_OK)

    return Response(status=status.HTTP_400_BAD_REQUEST)
