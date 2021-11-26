from django.contrib import admin

from .models import Address, Customer, DiscountCode

admin.site.register(Customer)
admin.site.register(Address)


@admin.register(DiscountCode)
class DiscountCodeAdmin(admin.ModelAdmin):
    pass
