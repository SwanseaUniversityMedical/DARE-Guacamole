import click
import logging

logger = logging.getLogger(__name__)


@click.command()
def main():
    logger.info("Starting controller...")


if __name__ == "__main__":
    print("print main")
    logger.info("logger main")
    main()
