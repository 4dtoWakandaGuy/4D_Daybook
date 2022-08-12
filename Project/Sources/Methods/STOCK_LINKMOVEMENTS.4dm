//%attributes = {}
If (False:C215)
	//Project Method Name:      STOCK_LINKMOVEMENTS
	//------------------ Method Notes ------------------
	//This method is run as a trigger when saving a stock movement
	//$1 is the movement you are saving
	//$2 is the previous movement to check
	//$3 is the next movement to check
	//$4----when called a second time this will be populated
	//if this is populated then we dont call that movement
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_Count)
	C_TEXT:C284($_t_DonotCall; $_t_oldMethodName; $1; $2; $3; $4; STOCK_t_CalledBy)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STOCK_LINKMOVEMENTS")
$_l_Count:=0
While (Semaphore:C143("$LinkingStock"))
	DelayTicks(40)
	$_l_Count:=$_l_Count+1
	If ($_l_Count>200)
		MESSAGE:C88("Long delay")
	End if 
End while 
READ WRITE:C146([STOCK_MOVEMENTS:40])
If (Count parameters:C259>=3)
	If ($1#"")
		If (Count parameters:C259>=4)
			$_t_DonotCall:=$4
		Else 
			$_t_DonotCall:=""
		End if 
		If ($2#"")
			If ($2#$_t_DonotCall)
				STOCK_t_CalledBy:=$1
				QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=$2)
				If ([STOCK_MOVEMENTS:40]XNextMovementCode:19#$1)
					Repeat 
						If (Check_Locked(->[STOCK_MOVEMENTS:40]; 1))
							If ([STOCK_MOVEMENTS:40]XNextMovementCode:19="")
								[STOCK_MOVEMENTS:40]XNextMovementCode:19:=$1
							End if 
							DB_SaveRecord(->[STOCK_MOVEMENTS:40])
							
						End if 
						
					Until ([STOCK_MOVEMENTS:40]XNextMovementCode:19=$1)
				End if 
			End if 
		End if 
		
		If ($3#"")
			If ($3#$_t_DonotCall)
				STOCK_t_CalledBy:=$1
				QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=$3)
				If ([STOCK_MOVEMENTS:40]XPreviousMovtCode:15#$1)
					Repeat 
						If (Check_Locked(->[STOCK_MOVEMENTS:40]; 1))
							If ([STOCK_MOVEMENTS:40]XPreviousMovtCode:15="")
								[STOCK_MOVEMENTS:40]XPreviousMovtCode:15:=$1
							End if 
							DB_SaveRecord(->[STOCK_MOVEMENTS:40])
						End if 
					Until ([STOCK_MOVEMENTS:40]XPreviousMovtCode:15#$1)
					
				End if 
				
			End if 
		End if 
	End if 
End if 
CLEAR SEMAPHORE:C144("$LinkingStock")

$0:=True:C214  //  for new ProcessServices 18/04/02 pb NEEDS CHECKING IN THIS METHOD
ERR_MethodTrackerReturn("STOCK_LINKMOVEMENTS"; $_t_oldMethodName)
