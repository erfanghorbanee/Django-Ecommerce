from django.urls import path
from .views import basket_view, add_to_basket, delete_from_basket, checkout, delete_address, create_order
from .api.views import update_session

urlpatterns = [
    path('basket/', basket_view, name='basket'),
    path('add-to-basket/', add_to_basket, name='add_to_basket'),
    path('delete-from-basket/<int:product_id>/', delete_from_basket, name='delete_from_basket'),
    path('checkout/', checkout, name='checkout'),
    path('delete-address/<int:address_id>/', delete_address, name='delete_address'),
    path('checkout/create-order/', create_order, name='create_order'),
    path('update-session/', update_session, name='update_session'),
]
