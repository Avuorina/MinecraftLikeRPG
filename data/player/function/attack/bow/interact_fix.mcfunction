#> player:attack/bow/interact_fix
# interactionに対する右クリックを弓の使用(Used.CoaS)として処理

advancement revoke @s only player:attack/bow_interact
scoreboard players set @s Used.CoaS 1
