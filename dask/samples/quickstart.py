from dask.distributed import Client
client = Client('scheduler:8786')

def square(x):
    return x ** 2

def neg(x):
    return -x

# This will run two different distributed operations
A = client.map(square, range(100))
B = client.map(neg, A)

total = client.submit(sum, B)
total.result()

client.gather(A)
