from fastapi import FastAPI
from enum import Enum

app = FastAPI()

BOOKS = {
    'book_1': {'title': 'Title One', 'author': 'Author One'},
    'book_2': {'title': 'Title Two', 'author': 'Author Two'},
    'book_3': {'title': 'Title Three', 'author': 'Author Three'},
    'book_4': {'title': 'Title Four', 'author': 'Author Four'},
    'book_5': {'title': 'Title Five', 'author': 'Author Five'},
}


class DirectionName(str, Enum):
    north = "North"
    south = "South"
    east = "East"
    west = "West"


@app.get('/')
async def read_all_books():
    return BOOKS
