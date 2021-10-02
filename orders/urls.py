from django.urls import path
from .views import basket_view, add_to_basket

urlpatterns = [
    path('basket/', basket_view, name='basket'),
    path('add_to_basket/', add_to_basket, name='add_to_basket'),

]