from django.contrib import admin
from .models import Customer, Address, DiscountCode

admin.site.register(Customer)
admin.site.register(Address)


@admin.register(DiscountCode)
class DiscountCodeAdmin(admin.ModelAdmin):
    pass
