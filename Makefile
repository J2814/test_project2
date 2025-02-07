.PHONY: setup install test run clean

# так сделал потому что мне сказал так сделать робот (ии), соответственно все остальные команды тоже подогнаны под venv (виртуальная среда)
setup:
	python -m venv venv

install: setup
	venv\Scripts\pip install -r requirements.txt


run:
	venv\Scripts\python main.py

test:
	venv\Scripts\python -m unittest discover tests

# Clean up (Windows-Compatible)
clean:
	@if exist venv rmdir /s /q venv
	@if exist __pycache__ rmdir /s /q __pycache__
