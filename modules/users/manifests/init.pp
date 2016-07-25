define useradd($name, $uid, $ssh_key_name, $ssh_key) {

    user { "$name":
        home       => "/home/$name",
        shell      => "/bin/bash",
        uid        => $uid,
        gid        => $uid,
        managehome => "true",
        groups => [],
    }
  
    group { "$name":
        gid => $uid,
    }
   
    ssh_authorized_key { "$ssh_key_name":
        user   => $name,
        ensure => present,
        type   => "ssh-rsa",
        key    => $ssh_key,
    }
    
}

class users {


useradd { "chenders": 
	name => "chenders", 
	uid => 1001,
	ssh_key_name => "chenders-key-pair-oregon",
	ssh_key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCWR1HbA7kQtEHE2qHTQnuTNsEGQtz8cMg5HID4WaMwOdNKGYR4ARmXHhI6Lpn2/kQ97ay2j1M1tYZhJSsglqrsGRY+gxEyr3Yp5Aq4KVLqYEnvHV5cfRbpekD3zGULH2dri8C/c/Z8ASBNHmm3deLz1IiB2IetTZ3fCS3VAqvlEF6WIbXw13j5kGGHbPG/TFevdKXwQTAK75P1LaNx00vjTHPP03/nmwRItl3lLuYS8RXyrOtmJR/oxCWqu+WZCBV5Dz37idScZ/kwrbjaDNTBrydC5lArn2x6m2r9JIn5cjI7hf3FZAfOkXSivxBTlpZ3hYW41XvHewLo3kKVIamX"
}
useradd { "stevev": 
	name => "stevev", 
	uid => 1002,
	ssh_key_name => "stevev-key-pair-oregon",
	ssh_key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCrFq80b0ptexNiI6KP4hxww5d5RFm8djIpsdJqRZDyoyD5vaf7d30bTLef8su6stHuBBjKccMcUjNyu4BliJBXIy7bKVDllVB5oeLFizDahQcgqjYfzyqj16uEa7NLBW5/3ljLpPX8XEI7YFM/hg65JFgpQIAiBi2N6bGj9mQrh/51SpCO6FruQH8KVjDl/CLgbnFq9cDwRDAo4tvPO1b0MRVrvM8BbZbBUHqV/093jVXkwY+BxsU6cgOnHrSmoTnH4MqMXUI/ok31JORVbWW5NAz28Ag7V/NbDvRBIYicJOd9aqEST/L812+tmnE8iQzn3bZvv7v0E7FHneCS5Qpz"
}
useradd { "sethplunkett": 
	name => "sethplunkett", 
	uid => 1003,
	ssh_key_name => "sethplunkett-key-pair",
	ssh_key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDRX1li+8TVLDpe5hKN+30F/azIvkDy0fUO1Ae5X43sWWEdrn874Jj6+TJLhhg0stG80idOUBLPKiGRzQYPI1a+7EGGekSqK1MiLaGI/qTah6eryE9dStOJvpLUxKz8eqsO5+kDan5buR4XMplu6ts5VVznWMvUuQQoKesJ6O8PrHLzwSF5Gw/Okbslx/MJ/SF/Rd4rWA1Vtiw46R8nY6Udeg2VqvCaDnO6AJHrqmiENKK6Nl8zf00LjI3HdAIeZ2Dqf5TOk/gnhy9TkfBnPv8wcyKbnm5nTPoidxDrzR8D65WpXDwwh1/RuavOI3ioDCq7/8irEQUtz4iHEuJkmxEp"
}
useradd { "bheng": 
	name => "bheng", 
	uid => 1004,
	ssh_key_name => "bheng-key-pair-oregon",
	ssh_key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCZZ3Gd+3oE71KdZBBP+5xkHizev7Jr5hCGC8mrn3Wef0Aql/hpGGDrAH0hEjeGs+nYMkyFM2EJH+Nt+hMXg59Pssruvgrv+5pVjIiDPucwxgcWHfyhwy7hUlReDiwz7C9VLZXgHdyv8vbMeSDPCO0sNXD1LLL6f6WjHMqsBXi8PXtwe9Bp+ZG+rsz1Odn2IxsYXC0d6kALfknVRDXQxXDFS1HN3vtti5uRMhUEt8/0ceqUDaLfXJ/IbnMtc1wzfV2VAcacvCzlbdjp1bO1Y6ToE4l9UvL9+5bp4mtEZHo61q913M4s2N2/HMk7IvYNJnlFKKAN6wEMlHnkBM7a36hX"
}
useradd { "jbrodnax": 
	name => "jbrodnax", 
	uid => 1005,
	ssh_key_name => "JIB-jbrodnax2-home",
	ssh_key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCPZKsyqF2qyLHNZOKyz6oiNK8BIuN7D9WT/TfwDv1eUccwfJJ9ZfSAWNggDhmW64JbwIQosv0NgJsqCXLUt+Ufc8Zd/hyuWTzM833nAiG1LWaesiNXRK6yKJ0qyitQlItCVHZ/Xcp7cJStIC2Fuh8La187BVxyTjRhhjMSP6wLmr++CAZ/coty4v2e9HKR9hJ3ytOfVkElg2I/CvucgpuerjWF+Ks1yKd9LK/t3xyYpzidWZpIug1+VDK/UhxlIaF7VXuea18xNytWEN11hJW16lFra/9/VbAPaxNQ64ygJvUeH2Ls69Z7BgRYv14xdqVy6uwJx5bGAgKlkyLeDHOr"
}
useradd { "zhibin": 
	name => "zhibin", 
	uid => 1006,
	ssh_key_name => "zhibin-key-pair",
	ssh_key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCxOAgiL2z7qRQ1cIHfmy8t/9nqEevGtAwiyHlFh0psj0Wfa0qAdkJVPafy8Nkhs+QXbkfPEl0tPR0I7fiFW4KP/ZWvOBDU2Bm1IHyn8NnO/mK2IY1B2qARjyfC0QiwE4pOlEJ/nUxTa3kpqrkI/lcMwGbxvptLYqgF10LecemY9vzd6MWhYTtfCgFPYThLHwihER/oFk3rnpIAO/roUYdc44ipnZt6bGtgJ4i1lcmLaQYMUT8E3PFjF3rGEprocyMMrl7pE7iqnIe/LSery9QKcJRARWmQ2JoITiwtHJ1loeT/IQPUayzbaM1oAmkUClx4TN96RBO1ZfPLz5TmyMDl"
}
useradd { "micahlevi": 
	name => "micahlevi", 
	uid => 1007,
	ssh_key_name => "micah-key-pair",
	ssh_key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCD3UJqrNj0QDly6MHV2tYfK+m12mq/jmCPfUAcaq1rh3vWl2hRUtC+Zk+AQQt7TMmByXO+fM8V6KfEYpSBygSf1yd2T/tvYtLmJ/70DbaiWoIbA5G2eOQlQE1W3YSvgwZ+FZC67jgC8iaU3Oon7n4PDHxWhElukFWFXfYy5nq4aNAgF6tlX/ETkXMjqRIEFbr2vD+HjTH3x0Svh2Sp5J2v1Vyn6dokIsk29zveN9tF3ZaSgwVUVGcwW167uAOKwDebQnfoXjHgYSRnUPEvptJoaHeeMSSvpwxrhOA8MeFSLG88nHffox7URq5oRoGxNsxux2lZUvpG9eD0/3i1aJ7f"
}
useradd { "costello": 
	name => "costello", 
	uid => 1008,
	ssh_key_name => "costello-key-pair",
	ssh_key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCPrg48+84u65bZqmcD9yRJd2ILijuiZY7+iFVgQtXi3HH2s0Pc807oo20lD9fVvjzMFlAUluAQ8GGaLAzTY3bN2iGDzvhtCrI0O9r6u/60WKmYmryuVXunTz28IiISH04AQhNvS3B4mAXE5ZlOtBONao15bQO9ulnH1/LWjtOhh/+XeF4TjyvctM5z+hU5BzGmH7zcPm3Uz9+bnq9yVqSBJXt9HSVba0TEzuQv8MIkZnXJmaSdVtyOY7MVqNo91UCD0IfBqvapt7iUXApU0Zkwoi/ybojz2bcjrf8EPE8GJ4cI6wQ957GuqoD7P2G7vJuQpF3A0fDtzGIbHvn33SKZ"
}
useradd { "elicaluya": 
	name => "elicaluya", 
	uid => 1009,
	ssh_key_name => "elijahcaluya_key_pair",
	ssh_key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCFr3mfY4/QWOsi2DowDDt9KoafoUFN2rdwEEK0Phq/jbhy8l397gIPxf4KWneIRydwX8hbTuLrk/9vbqOr4nL9joFGPql4h50+cM2awr0GFW17FqikYkPJSJ4VczNUzJIw8J9kTQEGZW31Ig0eKGCm1L1G0ARha+r3Zitk3Ed1W1RBT1wVfwokJVq3jzHTB8635tC1BQN0fGngKM21y5r4zSYio0+i/MbF+ObUbxrZvKwrejICEaj2FEZh6p/6ox1Oq+XiljT0qj6zt7l1HKT1O3P+xXxUYDms/fy2FCF/GNLmkep518PtEWGcAWkfJZQCc1ueECfY6KfMOre0r8jz"
}
useradd { "acgarvin": 
	name => "acgarvin", 
	uid => 1010,
	ssh_key_name => "ACG-key-pair",
	ssh_key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCdEemHGVVeacdNNYhmAG0FMn05Su+mXTMehI3xuFnl1BCU4dEv+x2VIQbwJDCY/YlfhSs1ozEab3bO2/CrcauqZYLUmvRW0oyKbgO2sFKFG2FOaEAejjy3nmhL5dmDiooQm0Ctk4rPE8Sf6Kt427yhErx462fHoGxJ/UVP4VGHHREA4MgdncyChCK/Zv5qj7M4woOV5Pw+mU2qjZVgIQrTjPUgO7P8PGhyYv4eBQTVvp6G7kbYafX+rYZUFUpyE84344WB5beLvFw+Am5imbm79oOaWJ4vUh75wfUnD0tBOXCMcCnlTinRX/cxTfs7eM61t3euMGn8ShzlaqBcMkTZ"
}
useradd { "pishpash": 
	name => "pishpash", 
	uid => 1011,
	ssh_key_name => "pasha-key-pair-oregon",
	ssh_key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCU0FxFGLvLP7eKHzPU2YsaHuBKVLO2dVnrSHWLplVZbPPF0V7r+D6kzkLrx0/xjJ965TmrTrzs0ODF6nWq3lNUkleUqtS+FFPuzXgJoL65LCQttnGdOhlaU2ntT0XX4teRgenQOuzUBH88F5jfK+jNiZnF7XcXJzIufgT/JLDRtknLpuda59HHtNyEQqWAyuWySj3NwYit+hG3qKzq8DOGZJIz2R1osCyHLqqYjpHQjyYK8cR1TI5CfDvvloGtk+2rmjphYFBlKLa6bjPUDC1qkzElpIrlKZUWsI+wuHHUb5ppm356CCf6uhnGInTvpkwr8tw1/i0LzAIc/JKeiPYf"
}
useradd { "clwaring": 
	name => "clwaring", 
	uid => 1012,
	ssh_key_name => "clwaring",
	ssh_key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCoamIc24g51gBC55Bbcq8AUi9ghA5Y7l3b8mnOQvX+kQJpfNt//cMbUXAhBMnjiv+cfFKi+klW8UUSI1SPccpV/nGbZH/k9XEKnpqK3XBRPUEHbA5QGujqOW7J44zjYKeXovH6PwQvZepjENI6ti3nBX7bvd8CRlMK3B3U4IJtghF8mz4FVLDjx1OOQAEDv5trzd7F0fRnWiuDVH9sUsVAeziUWhYKVmz9AhgSnnx8JSHXw6Rn5PGZyWDCttd0vG1KMPGULjc4nK5Oru3cu2Hsgb0dN0AjxbOwAamEto98zOe4HkO6oP71tOhk0KQmVKNgP/SpQ7Lh9gkTp2difDs/"
}

}
