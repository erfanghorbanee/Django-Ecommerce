from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response

from products.models import Product


@api_view(['POST', ])
def update_session(request):
    """
    updates basket data in session before moving to checkout
    """
    if request.user.is_authenticated:
        basket = request.session.get('basket')
        print(basket)   # basket before update

        product_id = request.POST['product_id']
        product = Product.objects.filter(id=product_id).first()

        new_quantity = int(request.POST['new_quantity'])

        # check if we have enough products in our shop.
        if new_quantity > product.count:
            return Response({"error": " متاسفانه این تعداد کالا در انبار موجود نیست."},
                            status=status.HTTP_406_NOT_ACCEPTABLE)

        basket[product_id] = new_quantity
        request.session['basket'] = basket

        print(request.session['basket'])  # basket after update

        return Response(status=status.HTTP_200_OK)

    return Response({"error": "لطفا ایتدا وارد اکانت خود شوید."},
                    status=status.HTTP_406_NOT_ACCEPTABLE)
