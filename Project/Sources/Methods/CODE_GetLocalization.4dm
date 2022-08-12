//%attributes = {"invisible":true,"shared":true}

If (Count parameters:C259>=4)
	$1->:=Get database localization:C1009(Current localization:K5:22)
	$2->:=Get database localization:C1009(Default localization:K5:21)
	$3->:=Get database localization:C1009(Internal 4D localization:K5:24)
	$4->:=Get database localization:C1009(User system localization:K5:23)
End if 