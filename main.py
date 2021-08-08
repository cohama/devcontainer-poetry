from time import sleep

import numpy as np
from tqdm import tqdm


def main():
    xs = np.ones((3, 2))
    print(xs)

    for i in tqdm(range(5)):
        sleep(0.2)


if __name__ == '__main__':
    main()
