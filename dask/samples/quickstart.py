from dask.distributed import Client
client = Client('scheduler:8786')

def square(x):
    return x ** 2

def neg(x):
    return -x

A = client.map(square, range(100))
B = client.map(neg, A)
total = client.submit(sum, B)
total.result()
client.gather(A)
