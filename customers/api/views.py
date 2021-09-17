# from rest_framework import status
# from rest_framework.decorators import api_view
# from rest_framework.response import Response
# from .serializers import CustomRegisterSerializer
#
#
# @api_view(['GET', 'POST'])
# def register(request):
#
#     if request.method == 'POST':
#         serializer = CustomRegisterSerializer(data=request.data)
#         if serializer.is_valid():
#             serializer.save()
#             return Response(serializer.data, status=status.HTTP_201_CREATED)
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
