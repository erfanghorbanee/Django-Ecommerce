from django.contrib import admin

from .models import Category, Product, ProductImage


# A class that displays Product in a table form
class ProductInline(admin.StackedInline):
    model = Product

    # Don't add any extra blank form for new Reviews
    extra = 0


# A class that lets us customize the Category list
@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    # Embed reviews in related businesses
    inlines = [ProductInline]

    # Properties in the Category list
    list_display = ("title",)

    # Add filters for state and stars
    # list_filter = ['stars', 'state']

    # Make the Category list searchable by title
    search_fields = ["title"]

    # We don't want ids showing up
    exclude = ("id",)


admin.site.register(ProductImage)
