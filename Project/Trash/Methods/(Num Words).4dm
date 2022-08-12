//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Num Words
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Amount2)
	C_REAL:C285($_r_Amount; $1)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Num Words")
$_r_Amount:=$1
$0:=""
If ($_r_Amount>=1000)
	$_l_Amount2:=Int:C8($_r_Amount/1000)
	$0:=$0+Num_Words2($_l_Amount2)+" thousand "
	$_r_Amount:=$_r_Amount-($_l_Amount2*1000)
End if 
If ($_r_Amount>=100)
	$_l_Amount2:=Int:C8($_r_Amount/100)
	$0:=$0+Num_Words2($_l_Amount2)+" hundred "
	$_r_Amount:=$_r_Amount-($_l_Amount2*100)
End if 
If ($_r_Amount>=20)
	$_l_Amount2:=Int:C8($_r_Amount/10)*10
	$0:=$0+("and "*(Num:C11(($0="@hundred ") | ($0="@thousand "))))+Num_Words2($_l_Amount2)
	$_r_Amount:=$_r_Amount-$_l_Amount2
End if 
If ($_r_Amount>=1)
	$_l_Amount2:=Int:C8($_r_Amount)
	$0:=$0+("and "*(Num:C11(($0="@hundred ") | ($0="@thousand "))))+("-"*(Num:C11($0="@ty")))+Num_Words2($_l_Amount2)
End if 
ERR_MethodTrackerReturn("Num Words"; $_t_oldMethodName)
