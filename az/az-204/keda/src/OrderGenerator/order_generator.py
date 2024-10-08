import json
import uuid
import asyncio
from faker import Faker
from azure.servicebus import ServiceBusClient, ServiceBusMessage

# Constantes
QUEUE_NAME = "orders"
CONNECTION_STRING = ""

# Clase Customer
class Customer:
    def __init__(self, first_name, last_name):
        self.FirstName = first_name
        self.LastName = last_name

# Clase Order
class Order:
    def __init__(self, order_id, amount, article_number, customer):
        self.Id = order_id
        self.Amount = amount
        self.ArticleNumber = article_number
        self.Customer = customer

# Función para generar una orden
def generate_order():
    fake = Faker()

    # Generar un cliente aleatorio
    customer = Customer(first_name=fake.first_name(), last_name=fake.last_name())

    # Generar una orden aleatoria
    order_id = str(uuid.uuid4())
    amount = fake.random_int(min=1, max=1000)
    article_number = fake.word()

    return Order(order_id=order_id, amount=amount, article_number=article_number, customer=customer)

# Función para determinar la cantidad de órdenes
def determine_order_amount():
    while True:
        raw_amount = input("Let's queue some orders, how many do you want? ")
        try:
            amount = int(raw_amount)
            return amount
        except ValueError:
            print("That's not a valid amount, let's try that again.")

# Función para encolar las órdenes en Azure Service Bus
async def queue_orders(requested_amount):
    # Crear el cliente de Service Bus
    async with ServiceBusClient.from_connection_string(CONNECTION_STRING) as servicebus_client:
        sender = servicebus_client.get_queue_sender(queue_name=QUEUE_NAME)
        
        async with sender:
            for current_order_amount in range(requested_amount):
                # Generar una nueva orden
                order = generate_order()
                # Serializar la orden a JSON
                raw_order = json.dumps(order.__dict__, default=lambda o: o.__dict__)

                # Crear el mensaje para la cola
                order_message = ServiceBusMessage(raw_order)

                print(f"Queuing order {order.Id} - A {order.ArticleNumber} for {order.Customer.FirstName} {order.Customer.LastName}")

                # Enviar el mensaje a la cola
                await sender.send_messages(order_message)

# Función principal
async def main():
    requested_amount = determine_order_amount()
    await queue_orders(requested_amount)
    print("That's it, see you later!")

# Ejecutar el script
if __name__ == "__main__":
    asyncio.run(main())
