//%attributes = {}
If (False:C215)
	//Project Method Name:      Num_Words2
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
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Num_Words2")
Case of 
	: ($1=0)
		$0:="nil"
	: ($1=1)
		$0:="one"
	: ($1=2)
		$0:="two"
	: ($1=3)
		$0:="three"
	: ($1=4)
		$0:="four"
	: ($1=5)
		$0:="five"
	: ($1=6)
		$0:="six"
	: ($1=7)
		$0:="seven"
	: ($1=8)
		$0:="eight"
	: ($1=9)
		$0:="nine"
	: ($1=10)
		$0:="ten"
	: ($1=11)
		$0:="eleven"
	: ($1=12)
		$0:="twelve"
	: ($1=13)
		$0:="thirteen"
	: ($1=14)
		$0:="fourteen"
	: ($1=15)
		$0:="fifteen"
	: ($1=16)
		$0:="sixteen"
	: ($1=17)
		$0:="seventeen"
	: ($1=18)
		$0:="eighteen"
	: ($1=19)
		$0:="nineteen"
	: ($1=20)
		$0:="twenty"
	: ($1=30)
		$0:="thirty"
	: ($1=40)
		$0:="forty"
	: ($1=50)
		$0:="fifty"
	: ($1=60)
		$0:="sixty"
	: ($1=70)
		$0:="seventy"
	: ($1=80)
		$0:="eighty"
	: ($1=90)
		$0:="ninety"
	Else 
		$0:=""
End case 
ERR_MethodTrackerReturn("Num_Words2"; $_t_oldMethodName)