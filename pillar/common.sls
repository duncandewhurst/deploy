# Values used on all servers. These may be overwritten.

prometheus:
  node_exporter:
    enabled: false

maintenance:
  enabled: false
  # Set safe default.
  patching: automatic

system_contacts:
  # For system notifications.
  root: "sysadmin@dogsbody.com"
  # For cron jobs.
  cron_admin: "sysadmin@open-contracting.org,sysadmin@dogsbody.com"

ssh:
  # Public keys of users with root access to all servers.
  admin:
    # Open Contracting Partnership
    # James
    - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2AYzfKIjwrhN7Jg3RrQKK/YJSVo1OSXadbhgE8mKMLi5nuDN6v9g8+QodcCEdA/AjGIr25CtBWcLwvT33h0SfMZ9a8Csq2pv6IAQkigxMrr8aBE9TL8pqQuwcc7CS9PQNYFuqpKoC4PSvNGqn9NRPtZmPkmcIa+CL/G6Y48HY36jWsauI8T8l4gMeOkH9bfB1yNRmEwQAuA+PmGXgGSlx7Gj+TofOHNbWj1l7lThFyG73qQfqyMPmfHPIjyu1EfA4lBezjcgJXlE2VodrLTFfimORJLHk684xnmf7935KwmjBqIucD16PE/KSOyj+vQxXZCTLsQjDuXr3GexOJBXx
    # Dogsbody Technology
    # Dan
    - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDMuqRautePvXhQm7LLw45j3zay2LcgeuacholOG7GFnolwP6DW+kJJF1ESC3i0F8kfLuUc8F1CLO3z4DMB670eHZzuRnSrdDr9AaHZMPSF82VPN92AqfTKhu/SJm/+05t5TpfdYfyf80zfRG8UfvmA/IOHCVv+tWPiVLBRvpFUITNEZcK5w0nb9uTsvI6mD9RnmRBcXUPk1KGxCVIgbdVjmlFcZUiWf8hlAHDflwOYaQbMr+HjvtGFosYbPR7p03i25B51kM0ObcjPxw1Os/mm5DhJa4qnmXYMAO1F2PIHjyCzRCJjDErJZFd9LRjMR6HYj5Pr2eJqClHPZb4b3DenK/i+pMM1yPNRlDLIuwl3tr8kU/FI7RSshjO8IUl9SdsNYlsipRcbtziPxG6Vl1EohdX1RC3z0ozr/o6SmI6a+mZ092u9ijEYKBSVV1TXlAS8yLQKiM8Tc/SsMowgxhIV7THIvOexlYITjs9uYlX6lLtUfDEzuRc3I4/QiXoMQLsjSE6h9GKsqqtCdEwN1DAdWkaWvDGRuCd3oiFWE6fffxJjh4DW3+Mza1bJ6OG3Z0z0SpEwFEot5PQhEVao2kqV2uewcBtpoMkkk/77zZEUuZgrk6fOMRFevprNTLvOk8/St2Rleee067aUTx960SSZ7vXjyqxnS+JljnjAfHpeNQ==
    - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC3CwDeD7Uxm7cQEo1MEgoZczxU4XfaNeQoFVmsLGIRoWGJ4M5HLVNryS/4QZiVqU/Y+crkse4ALMGuNHXmgYQBzvd+09F6wUCSvehwEBvBB+mQCNMVMrElUWi4Rd5T473ImDy5ACZzxx9itA+YfY71Kq5OmW8RwfWZnNWXsjPjRdDGgsi0XOAPL8YGiBUmLxZ1ELK0ifHoYTtrnKQ5HxuYh+P1Cd0uqrVJjqQQjyVq4FOeRUnYCBbEpkrpEb5DgeMZlIFycirhuTJTn/ExlMHRs1aY4JdX+VQhpHLoBw3dmLKa+QJGgcATbLWvQ+yX1xuUkuZIKF8oku/Md+y3mlE/N2IxmJZgZumn8VvCLkttJhYnGvRaAmTrAV/hbdyIZaeog0xgIImf27HUyPXPr9THJFCMRHGGrGUGkvROBt3neSFk+FtImb5ogERAaWVWmp1TKastHUwwqCgmf0G7bWT6ab98fi0Q+OIsXTSZgIuSot6XWdA/UIuGra5tBC7Ddwdj5x0DQm0InDDgXsPYnmFfte9m/GiDcA7AJwgVScU6Rp4A4W8n0TlHZSpuuhsw0JURTBvKBGhIK9pdCWZU0D/+Ju9ynEF9OiHFCqvWCxz7rSM2BYjRuwnPWf6z9UKkBUlnh7PRoIhRbiFfeQD4xopbsgHNr/gWIxlFe0l+IwYEvQ==
    # Jim
    - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCqHkOrOr+sMz8YhJuFw27f2H7d/Njo74llxzIPSVZYnGjkL0seI5FepjhJTuWt36pwrKlPEPMf15Bx58aESaJaIualjrzDzkEWR7sV/m0/4YjdB5iX+tlm3MjwK3yR3peG+oKEKLVIxUNC1bKD9B6Laqn0mJcgnCWYf5CFyu2B9bK4fIIzgzlNYJ+deB2o+XmQ3wcadilGWQmwZ2W+//RaKiyHnf+jsppHgLe2TCpByJva6ImTHecsVJKdz+FcrH0O0dpcL2a2ouLlTLnuELM9PC8NuuaOLIXSuK4JDmy6gdNVx+eH9ibmwpZcYhfXQOfOfhWxB5EmCLGMDPQ6GlHECqxRF4SImmo+l31itGjKlx8nY6LJZQfKI4/sfvi4ccp8JyLqUXNKobrVVCxsaacjfcoHJqDTHoe5H6z/73MQG0gqtDtMbOEp74qi5VNh3zQvXjAX2cKHzWQXRRpuNfbQ1kdYe+kzXZd1kFT8bQ33nBW3Kv59JtV0fmlI0ci2ZoJYlY03G08fqEe52aeIgwxPo76eGLiFZhCHhakfvTLM4Z3V1Elzp+l3jsWH8YSR1OcNCuNJ3R5GbjW8M82kfFFCX/zZWTByuZHFWWSfnVssAoSbE70QWtAgBdnLLYi8Y7kqCTyNGivYaMbIgeMnWQzrlclq4IuaaliL45sP0TFluQ==
    # Rob
    - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDtOb64j3tGaY+JNzBqFOd4reuhls+iD6ay3DZQg+kbC7kqOssWWkkM/qnK99JMqPDc4ryCaxbqX/ODG5CmyOlRuqnSfUq2eeXlmhaonmF5jrZApoK+QQ7T4qcbe7KA0Drtw/V4BDVxfEpmFNj3Uh7/vLqHRAFQWG5zZxHW94JPC/e+AR566/JS2F/ePv+7+FtUsEXY3YFID/XKq/EyZov8MEDmLBfVRP/gY4KikpF5VYYKn77Dc6BVqv1QxRn83PERA/F1/+eqrEwn6PjKV/dskqeWg8TZn3f45kEcTvxrYPbZ3qfzSx/0xGAorz7DOgluoth7pvqoX4YrwbiP0FuJ
    # Ashley
    - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDRplGpMwPSOHEKoZU+D6G9ZPhy+UwZkW3PbopFrnmqmrugF96Hd50EL0NpjYt9TdujgwqPTe9xjqDT62DNcR5sFAba3lb/eVOc5f3eBaCWmefp/geVRW88xUQ9zY5wMyIriAl4mBo6TJydGi/pwQi4yIvZLSVPmiwwuifoaMjuAH4Mk+1CbHpwinXdWZMTLGQ13eNgPMx/1UGai3kclFjzcLb/lwTz4FaJ1DYEtRIO3YtAccMJKjNr8EPGcyMr59B6yKnEAe78Fhl9LnV6O7OKhLc/m049CNVPLd2h9mD/L0LerwxFLZnJ1IYhddSUctXJHJqIcEGedC/mdT30aQYHTzfl6EGqX5PMipLTmJ5rpVhCz1Hr2J+2D7f/rD4uJQt1XrLnE+nzTqDsxxsdNrhi5EBR22kUDXj9EpWh17Ig8RNBMvY20Jxs1szqzIiBmoTWmY/5Ep/Sz2wkZDAi369xuG2N0Z2P8n8pEpRiQ7uUbdB/c+i6byTeeClt61ftJnummVFgvt0MiASVOqEAE6ir7g/hVS1tqXhLnomH8jOlxZep0rbiBNZY8kGm331nF5DxfnQv/03Fn1GOl2EmFLjMgnlTe5d/FTSgfJA2d6RILVp9Vd8JkpqJfexqlJhzHV1N3c+5DzTBKtz5KZYUXcTUJSA4NGE6pHjpPjBG0k/wXw==
    # Josh
    - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCUuQWZWXWk+a2qjE67IuUGWgG1fb6/Nw/4div9e5AIxmpj43HxoM2k1lS+qM3IF0s+A5TGzb7GWbZoOS568og8zMNLdN5X+NcU99tzXLAuQTMY8bdHBmFWFmPt+FvMSxZIuAVtHZ3fXhZNWJBivgPktiE9J2YFcdwwFBysgPRqSAPfGMl/6mpyRe9PNP56Ab1y/Vp2SXDCcfUmU6fu1qULb9s1EkOy3an/FjbNrbmFklxWBJGEeNZuoDcf23Tj8EafT/pO9B+ayJtmmQ+ld7joID6/7/2GeLyH9wBtuBnDlom1FsZxqU8G6RhlqiqtIOK+t4Zxc70P32iQQ/5R9owXFxGJcPqqiQSLfuBRBKw9AhCuLPtpaiiS4T4tbPmMRrxMfQDawb0dej83CwsLZnB8XHNGn5XvvnFcc9nF2yrOQOaD4m8U79TifaB2+bUWsjuxbXSMCy2lg3EWlMrA157eG+IrXjE0NhxPhn4Hxet1IArN4ntk7PndqWg7xfzaFDgZJVQ9tjlQSXDY7v98D3nyJf+8Xr+pUp578ugEo3P5gCjsa2IuivovUEWoU4dVX5NjzyRB8dpgWmLOXUMREaRTgFv7WC+lLf6rZvtVdmuLX9Tzfjb2FfPfUTLB9gnGSA4SOt368RFQM00GnSOIq0aLZsIBQXjcw3KdFK5YxtVKSQ==
