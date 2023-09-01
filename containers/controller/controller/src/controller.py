import click
import logging

logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s %(levelname)s %(module)s %(funcName)s %(message)s',
    handlers=[logging.StreamHandler()]
)

logger = logging.getLogger(__name__)


@click.command()
def main():
    logger.info("Starting controller...")


if __name__ == "__main__":
    main()
