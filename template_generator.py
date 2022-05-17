"""
Script to automatically create a release branch
from an identified baseline release candidate
"""

import argparse
import json
from copier import run_auto


def parse_args():
    """Parse args"""
    parser = argparse.ArgumentParser(description='Create branch')
    parser.add_argument(
        '--template',
        action='store',
        required=True,
        dest='template',
        help=''
    )
    parser.add_argument(
        '--dest',
        action='store',
        default=".",
        required=True,
        dest='dest',
        help=''
    )
    parser.add_argument(
        '--data',
        action='store',
        required=True,
        dest='data',
        help=''
    )
    args = parser.parse_args()

    return args


def main():
    """Main function"""
    args = parse_args()
    data = {}
    for i in args.data.split(','):
        data[i.split('=')[0]]=i.split('=')[1]
    run_auto(src_path=args.template, dst_path=args.dest, data=data)


if __name__ == "__main__":
    main()