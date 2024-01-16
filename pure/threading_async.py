from threading import Thread
from time import sleep


def loop_sleep(time_secs: int):
    while True:
        print(time_secs)
        sleep(time_secs)
    


def main():
    threads = [
        Thread(target=loop_sleep, args=(x * 10 , )) for x in range(1, 100000)
    ]
    _ = tuple(t.start() for t in threads)
    print(tuple((t.join() for t in threads)))


if __name__ == '__main__':
    print("running")
    main()

