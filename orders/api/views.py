from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response


@api_view(['POST', ])
def update_session(request):
    """
    updates basket data in session before moving to checkout
    """
    if request.user.is_authenticated:
        basket = request.session.get('basket')
        print(basket)   # before

        product_id = request.POST['product_id']
        new_quantity = request.POST['new_quantity']
        basket[product_id] = new_quantity
        request.session['basket'] = basket

        print(request.session['basket'])  # after

        return Response(status=status.HTTP_200_OK)

    return Response({"error": "لطفا ایتدا وارد اکانت خود شوید."},
                    status=status.HTTP_406_NOT_ACCEPTABLE)
