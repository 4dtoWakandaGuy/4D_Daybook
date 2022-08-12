//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_LayerMatch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2009 18:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_AllLayers; 0)
	ARRAY TEXT:C222($_at_ApplicableLayer; 0)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_Index; $_l_LayerPostion)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_LayerMatch")
//This method loads the blob of Layers and tests if $1 is in the array
If (Count parameters:C259>=1)
	If (Records in selection:C76([ACCOUNTS_LAYERS:156])>0) & (BLOB size:C605([ACCOUNTS:32]xLayerCodes:11)=0)
		//Data not updated
		QUERY:C277([ACCOUNTS_LAYERS:156]; [ACCOUNTS_LAYERS:156]Account_Code:3=[ACCOUNTS:32]Account_Code:2)
		ARRAY TEXT:C222($_at_ApplicableLayer; Records in selection:C76([ACCOUNTS_LAYERS:156]))
		For ($_l_Index; 1; Records in selection:C76([ACCOUNTS_LAYERS:156]))
			$_at_ApplicableLayer{$_l_Index}:=[ACCOUNTS_LAYERS:156]Layer_Code:1
			NEXT RECORD:C51([ACCOUNTS_LAYERS:156])
			
		End for 
	Else 
		ARRAY TEXT:C222($_at_ApplicableLayer; 0)
		If (BLOB size:C605([ACCOUNTS:32]xLayerCodes:11)>0)
			ARRAY TEXT:C222($_at_ApplicableLayer; 0)
			BLOB TO VARIABLE:C533([ACCOUNTS:32]xLayerCodes:11; $_at_ApplicableLayer)
			ALL RECORDS:C47([LAYERS:76])
			SELECTION TO ARRAY:C260([LAYERS:76]Layer_Code:1; $_at_AllLayers)
			For ($_l_Index; Size of array:C274($_at_ApplicableLayer); 1; -1)
				$_l_LayerPostion:=Find in array:C230($_at_AllLayers; $_at_ApplicableLayer{$_l_Index})
				If ($_l_LayerPostion<0)
					DELETE FROM ARRAY:C228($_at_ApplicableLayer; $_l_Index)
				End if 
			End for 
		End if 
	End if 
	If (Size of array:C274($_at_ApplicableLayer)>0)
		$_l_LayerPostion:=Find in array:C230($_at_ApplicableLayer; $1)
		If ($_l_LayerPostion>0)
			$0:=True:C214
		Else 
			$0:=False:C215
		End if 
	Else 
		$0:=True:C214
	End if 
Else 
	$0:=True:C214
End if 
ERR_MethodTrackerReturn("ACC_LayerMatch"; $_t_oldMethodName)