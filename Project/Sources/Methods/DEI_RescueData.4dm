//%attributes = {}
If (False:C215)
	//Project Method Name:      DEI_RescueData
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 13:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_UniqueErrorFound)
	C_LONGINT:C283($_l_Index; $_l_RecordsinSelection; $_l_SIzeOfArray; $_l_TableIndex; $_l_TableNumber; $_l_Thermometer; $_r_PercentageDone; $0)
	C_POINTER:C301($_ptr_RescueTableArray; $_ptr_Table; $1)
	C_REAL:C285($_r_DataFileSize)
	C_TEXT:C284($_t_FreeSpaceVolume; $_t_oldMethodName; $_t_RescueFile; $_t_RescueFileOLD; $_t_RescueFolder; $_t_RescueFolderOLD; $_t_StructureFolder; $_t_StructureVolume; $_t_TableName; $_t_ValidFileName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DEI_RescueData")
//bsw 15/12/03
//Rescue Data method
//$1 Pointer to string Array (31) with the table names to rescue
//$0 error code


If ((Not:C34(Is nil pointer:C315($1))) & (Count parameters:C259>0))
	
	//check HDD space
	$_t_StructureVolume:=DB_GetVolumeFromPath
	$_r_DataFileSize:=Get document size:C479(Data file:C490)
	$_t_FreeSpaceVolume:=DB_FindVolumeForSpace($_r_DataFileSize)
	
	If ($_t_StructureVolume=$_t_FreeSpaceVolume)
		// Continue
		$_ptr_RescueTableArray:=$1
		
		
		$_l_SIzeOfArray:=Size of array:C274($_ptr_RescueTableArray->)
		
		If ($_l_SIzeOfArray>0)
			
			CONFIRM:C162("Rescue data from : "+String:C10($_l_SIzeOfArray)+" table(s)? In case of large database it may take a long time to rescue data!")
			
			If (OK=1)
				//rescue data
				
				$_l_Thermometer:=OPEN_THERMOMETER("...rescuing tables")
				
				//Folder separator:=DB_DirSymbol 
				$_t_StructureFolder:=DB_StructureFolder
				$_t_RescueFolder:=$_t_StructureFolder+"Rescue"
				
				If (Test path name:C476($_t_RescueFolder)#Is a folder:K24:2)
					CREATE FOLDER:C475($_t_RescueFolder)
				End if 
				
				For ($_l_TableIndex; 1; $_l_SIzeOfArray)
					
					$_t_TableName:=$_ptr_RescueTableArray->{$_l_TableIndex}
					$_l_TableNumber:=DEI_TableNum($_t_TableName)
					
					If ($_l_TableNumber>0)
						
						$_t_ValidFileName:="TBL"+String:C10($_l_TableNumber; "000")
						If (Length:C16($_t_ValidFileName)>14)
							//TRACE
							$_t_ValidFileName:=Substring:C12($_t_ValidFileName; 1; 14)
						End if 
						$_t_RescueFile:=$_t_RescueFolder+Folder separator:K24:12+$_t_ValidFileName+".txt"
						
						If (Test path name:C476($_t_RescueFile)=Is a document:K24:1)
							$_t_RescueFolderOLD:=$_t_StructureFolder+"Rescue_"+String:C10(Tickcount:C458)
							If (Test path name:C476($_t_RescueFolderOLD)#Is a folder:K24:2)
								CREATE FOLDER:C475($_t_RescueFolderOLD)
							End if 
							$_t_RescueFileOLD:=$_t_RescueFolderOLD+Folder separator:K24:12+$_t_ValidFileName+"_"+String:C10(Tickcount:C458)+".txt"
							MOVE DOCUMENT:C540($_t_RescueFile; $_t_RescueFileOLD)
						End if 
						
						$_ptr_Table:=Table:C252($_l_TableNumber)
						$_bo_UniqueErrorFound:=DEI_ReportConflict4Table($_ptr_Table)
						
						If (Not:C34(Is nil pointer:C315($_ptr_Table)))
							
							ALL RECORDS:C47($_ptr_Table->)
							$_l_RecordsinSelection:=Records in selection:C76($_ptr_Table->)
							
							If ($_l_RecordsinSelection>0)
								
								SET CHANNEL:C77(11)
								SET CHANNEL:C77(10; $_t_RescueFile)
								
								SEND VARIABLE:C80($_l_RecordsinSelection)
								
								FIRST RECORD:C50($_ptr_Table->)
								
								For ($_l_Index; 1; $_l_RecordsinSelection)
									$_r_PercentageDone:=($_l_Index/$_l_RecordsinSelection)*100
									SET_THERMOMETER("...rescuing "+$_t_TableName+" - "+String:C10($_l_Index)+" of "+String:C10($_l_RecordsinSelection); $_r_PercentageDone)
									SEND RECORD:C78($_ptr_Table->)
									NEXT RECORD:C51($_ptr_Table->)
								End for 
								
								SET CHANNEL:C77(11)
								
								UNLOAD RECORD:C212($_ptr_Table->)
								REDUCE SELECTION:C351($_ptr_Table->; 0)
								
							End if 
						End if 
					End if 
					
				End for 
				
				CLOSE_THERMOMETER
				UnloadAllRecords
				$0:=0
				
			End if 
			
		Else 
			ALERT:C41("Rescue failed, No table selected to rescue!")
			$0:=-1
		End if 
		
	Else 
		ALERT:C41("A volume with at least "+String:C10($_r_DataFileSize)+" of free space is required for this operation!"+Char:C90(13)+"Try "+$_t_FreeSpaceVolume)
		$0:=-4
	End if 
	
	
Else 
	ALERT:C41("Rescue failed, unexpected syntax error occurred!")
	$0:=-2
End if 
ERR_MethodTrackerReturn("DEI_RescueData"; $_t_oldMethodName)