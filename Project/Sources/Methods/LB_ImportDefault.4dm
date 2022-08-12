//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_ImportDefault
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/09/2012 06:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_DocumentPath; $_t_oldMethodName; $_t_StructurePath; $1; $LAY_t_CurrentDefsName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_ImportDefault")

If (Count parameters:C259>=1)
	$LAY_t_CurrentDefsName:=$1
	
	$_t_StructurePath:=Get 4D folder:C485(Database folder:K5:14)
	
	If (Not:C34(Test path name:C476($_t_StructurePath+"Resources"+Folder separator:K24:12+"LAYOUTCONFIGS")=Is a folder:K24:2))
		If (Not:C34(Test path name:C476($_t_StructurePath+"Resources")=Is a folder:K24:2))
			CREATE FOLDER:C475($_t_StructurePath+"Resources")
		End if 
		If (Not:C34(Test path name:C476($_t_StructurePath+"Resources"+Folder separator:K24:12+"LAYOUTCONFIGS")=Is a folder:K24:2))
			CREATE FOLDER:C475($_t_StructurePath+"Resources"+Folder separator:K24:12+"LAYOUTCONFIGS")
		End if 
	End if 
	$_t_DocumentPath:=$_t_StructurePath+"Resources"+Folder separator:K24:12+"LAYOUTCONFIGS"+Folder separator:K24:12+$LAY_t_CurrentDefsName+".txt"
	
	QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$LAY_t_CurrentDefsName)
	DELETE SELECTION:C66([LIST_LAYOUTS:96])
	CREATE EMPTY SET:C140([LIST_LAYOUTS:96]; "$TEMP")
	If (Test path name:C476($_t_DocumentPath)=Is a document:K24:1)
		SET CHANNEL:C77(10; $_t_DocumentPath)
		While (OK=1)
			RECEIVE RECORD:C79([LIST_LAYOUTS:96])
			If ([LIST_LAYOUTS:96]Layout_Reference:1#"")
				AA_CheckUUID(Table:C252(->[LIST_LAYOUTS:96]))
				
				
				SAVE RECORD:C53([LIST_LAYOUTS:96])
			End if 
			ADD TO SET:C119([LIST_LAYOUTS:96]; "$TEMP")
			
		End while 
		OK:=1
		SET CHANNEL:C77(11)
		USE SET:C118("$TEMP")
		APPLY TO SELECTION:C70([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1:=$LAY_t_CurrentDefsName)
		$0:=False:C215
	Else 
		$0:=True:C214
	End if 
Else 
	$0:=True:C214
End if 
ERR_MethodTrackerReturn("LB_ImportDefault"; $_t_oldMethodName)