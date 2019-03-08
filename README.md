# Next Generation Networks(Baby)
## Descript
これはictsc2018で `Next Generation Networks(Baby)` と第して出題した問題を体験できるconfigとvagrantfileです。
SFCの具体的なコンフィグ例を体験することができます。

## usage
### 初期化
`bento/ubuntu-18.04` を`vagrant up`して, `config/setup.sh` をsudo権限で実行します。
それが完了したあと、`ictsc_SRT` という名前でbox化します。
### 実行
前述したものを実行したあとは今回uploadしたvagrantfileで `vagrant up` をする。

### 問題を解くためには。
まずはじめにhostAからhostBへの疎通を確認する。そのうえでコンフィグを変更する。
具体的にはRouter1, Router5からネームスペースを区切っているSnortのノードを変更することになります。

```
# Router1
ip route add 10.0.1.0/24 encap seg6 mode encap segs fc00:3::bb,fc00:5::bb,fc00:4::bb dev eth1
ip -6 route add fc00:1::bb/128 encap seg6local action End.DX4 nh4 10.0.0.1 dev eth2

# Router5(SnortMode Side)
depmod -a && modprobe srext
sudo srconf localsid add fc00:5::bb end.ad4 ip 192.168.1.2 veth0 veth1
```

これでサービスチェインをして通信を確認できます。

## toplo

![image](https://github.com/takehaya/SRv6_SFC_Example/blob/master/SRT_toplo.001.png)