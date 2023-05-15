from typing import List
from typing import Tuple

def add_numbers(numbers: List[int]) -> int:
    return sum(numbers)

def get_user_info() -> Tuple[str, int, str]:
    name = 'Alice'
    age = 30
    occupation = 'Engineer'
    return (name, age, occupation)
