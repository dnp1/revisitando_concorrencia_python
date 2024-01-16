from asyncio import gather, run, sleep


async def print_sleep(sleep_time: int) -> None:
    while True:
        print(sleep_time)
        await sleep(sleep_time)


async def main():
    await gather(*(print_sleep(x * 10) for x in range(1, 100000)))




if __name__ == '__main__':
    run(main())
