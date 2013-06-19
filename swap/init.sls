/mnt/swap:
  cmd:
    - script
    - source: salt://swap/swap.sh
    - onlyif: 'test ! -e /mnt/swap'

swap:
  mount.mounted:
    - name: none
    - device: /mnt/swap
    - fstype: swap
    - opts:
      - sw
    - order: last
