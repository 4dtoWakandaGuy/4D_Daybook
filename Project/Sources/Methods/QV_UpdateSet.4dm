//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_UpdateSet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 14:41
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_RelatedRecordNumber; 0)
	ARRAY LONGINT:C221($_al_TableRange; 0)
	//ARRAY LONGINT(QV_al_ListQualityLevels;0)
	//ARRAY LONGINT(QV_al_ListQualityYears;0)
	//ARRAY LONGINT(QV_al_QualityLevels;0)
	//ARRAY LONGINT(QV_al_QualityYears;0)
	//ARRAY LONGINT(SM_al_RecordNumbers;0)
	//ARRAY TEXT(QV_at_ListQualityLevels;0)
	//ARRAY TEXT(QV_at_ListQualityYears;0)
	//ARRAY TEXT(QV_at_QualityLevels;0)
	//ARRAY TEXT(QV_at_QualityYears;0)
	C_BOOLEAN:C305($_bo_AddInformation; $_bo_OK; $_bo_ROState; $0; $4)
	C_LONGINT:C283($_l_CountRecords; $_l_Delay; $_l_DelayCount; $_l_Index; $_l_InformationType; $_l_InformationYear; $_l_InformationYearRow; $_l_Level; $_l_ListID; $_l_offset; $_l_ProcessState)
	C_LONGINT:C283($_l_ProcessTime; $_l_QualityID; $_l_QualityLevelRow; $_l_RecordNumber; $_l_RecordNumberRow; $_l_Repeats; $_l_Set; $_l_TableNumber; $1; $2; $3)
	C_LONGINT:C283($5)
	C_POINTER:C301($_ptr_Field; $_Ptr_Table)
	C_TEXT:C284($_t_oldMethodName; $_t_processName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_UpdateSet")
If (Count parameters:C259>=5)
	$_l_InformationType:=$5
Else 
	$_l_InformationType:=1
End if 


$_l_DelayCount:=0
$0:=True:C214  // for the new process service 17/04/02 pb
PROCESS PROPERTIES:C336(Current process:C322; $_t_processName; $_l_ProcessState; $_l_ProcessTime)  // 18/04/02 PB
//Here I want to check the data now

While (Semaphore:C143("$LinkingQualities"))
	DelayTicks(40)
	$_l_DelayCount:=$_l_DelayCount+1
	If ($_l_DelayCount>200)
		MESSAGE:C88("Long delay")
	End if 
End while 
//$2=The Set ID(this is the list item ID for the qualities ITEM
//UPDATE $2 can be the set ID for the level or year as wel l NG 12.11.2002
//$3 is the RECORD ID of the qualities-if we are adding ONE record
//The set is stored in the [USER_SETS] table
//we need a set_ID for this
If (Count parameters:C259>=2)
	// If ($2>999999) | ($2<-999999)
	Case of 
		: ((($2>999999) | ($2<-999999)) & ($_t_processName#"Service Process"))  // 17/4/02 pb
			//     ALERT("CODE PROBLEM (1)")
			Gen_Alert("CODE PROBLEM (1)")
		: ((($2>999999) | ($2<-999999)) & ($_t_processName="Service Process"))  // 17/4/02 pb
			$0:=False:C215  // for the new process service 17/04/02 pb
			[PROCESSES_TO_HANDLE:115]Comments:3:="CODE PROBLEM (1)"
	End case 
	ARRAY LONGINT:C221($_al_TableRange; 0)
	If ($1>0)
		ARRAY LONGINT:C221($_al_TableRange; 1)
		$_al_TableRange{1}:=$1
	Else 
		//need to find out what tables are needed
		If ($3=0)
			If ($2>0)
				QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityID:14=$2; *)
				QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]Deleted:10=0)
			Else 
				QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityGroupID:15=Abs:C99($2); *)
				QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]Deleted:10=0)
			End if 
			
			DISTINCT VALUES:C339([INFORMATION:55]RelatedTableNumber:11; $_al_TableRange)
		Else 
			QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityRecordID:16=$3)
			// QUERY([INFORMATION]; & ;[INFORMATION]Deleted=0)
			ARRAY LONGINT:C221($_al_TableRange; 1)
			$_al_TableRange{1}:=[INFORMATION:55]RelatedTableNumber:11
		End if 
	End if 
	
	For ($_l_Index; 1; Size of array:C274($_al_TableRange))
		If ($_al_TableRange{$_l_Index}>0)
			$_l_TableNumber:=$_al_TableRange{$_l_Index}
			//$_l_Set:=-$2
			//$SETIDSTR:=$_l_TableNumber+$_l_Set
			// $SETIDNUM:=-Num($SETIDSTR)
			READ WRITE:C146([USER_SETS:105])
			QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=Abs:C99($2); *)
			QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_al_TableRange{$_l_Index})
			If (Records in selection:C76([USER_SETS:105])=0)
				//this is not built
				CREATE RECORD:C68([USER_SETS:105])
				[USER_SETS:105]SET_ID:3:=Abs:C99($2)
				[USER_SETS:105]Set_Table:5:=$_al_TableRange{$_l_Index}
				DB_SaveRecord(->[USER_SETS:105])
				AA_CheckFileUnlocked(->[USER_SETS:105]x_RecID:1)
			Else 
				$_l_Repeats:=0
				$_l_Delay:=1
				Repeat 
					$_l_Repeats:=$_l_Repeats+1
					$_bo_OK:=Check_Locked(->[USER_SETS:105]; 1)
					If (Not:C34($_bo_OK))
						IDLE:C311
						If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
							//only increase every 10 tries
							$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
						End if 
						DelayTicks(2*$_l_Delay)
					End if 
				Until ($_bo_OK=True:C214)
				
			End if 
			If ($3>0)
				//we are adding or removing one record to this
				//we need to f
				MESSAGES OFF:C175
				READ ONLY:C145([INFORMATION:55])
				QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityRecordID:16=$3)
				If ([INFORMATION:55]RelatedTableNumber:11>0) & ([INFORMATION:55]RelatedTableFieldNum:12>0)
					$_Ptr_Table:=Table:C252([INFORMATION:55]RelatedTableNumber:11)
					$_ptr_Field:=Field:C253([INFORMATION:55]RelatedTableNumber:11; [INFORMATION:55]RelatedTableFieldNum:12)
					QUERY:C277($_Ptr_Table->; $_ptr_Field->=[INFORMATION:55]RelateTableRecordNumber:13)
					$_l_RecordNumber:=Record number:C243($_Ptr_Table->)
					ARRAY LONGINT:C221(SM_al_RecordNumbers; 0)
					READ WRITE:C146([USER_SETS:105])
					QUERY:C277([USER_SETS:105]; [USER_SETS:105]SET_ID:3=Abs:C99($2); *)
					QUERY:C277([USER_SETS:105];  & ; [USER_SETS:105]Set_Table:5=$_al_TableRange{$_l_Index})
					$_l_offset:=0
					BLOB TO VARIABLE:C533([USER_SETS:105]SET_BLOB:4; SM_al_RecordNumbers; $_l_offset)
					$_l_RecordNumberRow:=Find in array:C230(SM_al_RecordNumbers; $_l_RecordNumber)
					If ($_l_RecordNumberRow<0)
						If (Count parameters:C259<4)
							$_bo_AddInformation:=True:C214
						Else 
							$_bo_AddInformation:=(Not:C34($4))
						End if 
						
						If ($_bo_AddInformation) & (Not:C34([INFORMATION:55]Deleted:10=1))  //dont add if deleted!!!!!
							INSERT IN ARRAY:C227(SM_al_RecordNumbers; Size of array:C274(SM_al_RecordNumbers)+1; 1)
							SM_al_RecordNumbers{Size of array:C274(SM_al_RecordNumbers)}:=$_l_RecordNumber
						End if 
					Else 
						If (Count parameters:C259>=4)
							If ($4)
								//removing from set
								DELETE FROM ARRAY:C228(SM_al_RecordNumbers; $_l_RecordNumberRow; 1)
							End if 
						End if 
						
					End if 
					$_l_offset:=0
					VARIABLE TO BLOB:C532(SM_al_RecordNumbers; [USER_SETS:105]SET_BLOB:4)
					DB_SaveRecord(->[USER_SETS:105])
					AA_CheckFileUnlocked(->[USER_SETS:105]x_RecID:1)
					UNLOAD RECORD:C212([USER_SETS:105])
					READ ONLY:C145([USER_SETS:105])
				End if 
				
			Else 
				//adding all records
				MESSAGES OFF:C175
				READ ONLY:C145([INFORMATION:55])
				If ($2>0)
					Case of 
						: ($_l_InformationType=1) | ($_l_InformationType=0)
							QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityID:14=$2; *)
						: ($_l_InformationType=2)
							//Feb 2004 changing this the id is unique to the quality
							QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=$2)
							$_l_Level:=Num:C11([LIST_ITEMS:95]List_Entry:2)
							QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=[LIST_ITEMS:95]X_ListID:4)
							//and that tels us the quality!
							$_l_QualityID:=Num:C11([X_LISTS:111]x_ListName:2)
							If ($_l_QualityID>0)
								If ($_l_Level>0)
									
									QUERY:C277([INFORMATION:55]; [INFORMATION:55]Information_Level:4=$_l_Level; *)
									QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]QualityID:14=$_l_QualityID; *)
								Else 
									//something wrong!!
									QUERY:C277([INFORMATION:55]; [INFORMATION:55]Information_Level:4=9999999; *)
								End if 
							Else 
								QUERY:C277([INFORMATION:55]; [INFORMATION:55]Information_Level:4=9999999; *)
							End if 
							
							If (False:C215)
								ARRAY TEXT:C222(QV_at_ListQualityLevels; 0)
								ARRAY LONGINT:C221(QV_al_ListQualityLevels; 0)
								$_l_ListID:=AA_LoadListByName("Information Levels"; ->QV_at_ListQualityLevels; ->QV_al_ListQualityLevels; False:C215)
								$_l_QualityLevelRow:=Find in array:C230(QV_al_ListQualityLevels; $2)
								
								If ($_l_QualityLevelRow>0)
									$_l_Level:=Num:C11(QV_at_ListQualityLevels{$_l_QualityLevelRow})
									QUERY:C277([INFORMATION:55]; [INFORMATION:55]Information_Level:4=$_l_Level; *)
								Else 
									//something wrong!!
									QUERY:C277([INFORMATION:55]; [INFORMATION:55]Information_Level:4=9999999; *)
								End if 
							End if 
						: ($_l_InformationType=3)
							QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=$2)
							$_l_InformationYear:=Num:C11([LIST_ITEMS:95]List_Entry:2)
							QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=[LIST_ITEMS:95]X_ListID:4)
							//and that tels us the quality!
							$_l_QualityID:=Num:C11([X_LISTS:111]x_ListName:2)
							If ($_l_QualityID>0)
								If ($_l_InformationYear>0)
									
									QUERY:C277([INFORMATION:55]; [INFORMATION:55]Year:5=$_l_InformationYear; *)
									QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]QualityID:14=$_l_QualityID; *)
								Else 
									//something wrong!!
									QUERY:C277([INFORMATION:55]; [INFORMATION:55]Year:5=9999999; *)
								End if 
							Else 
								QUERY:C277([INFORMATION:55]; [INFORMATION:55]Year:5=9999999; *)
							End if 
							If (False:C215)
								ARRAY TEXT:C222(QV_at_ListQualityYears; 0)  //do not confused this with what was QV_at_QualityYears. This one was QV_at_QualityYears
								ARRAY LONGINT:C221(QV_al_ListQualityYears; 0)  //NG Checked April 2020 this would be correct-
								$_l_ListID:=AA_LoadListByName("Information Years"; ->QV_at_ListQualityYears; ->QV_al_ListQualityYears; False:C215)
								$_l_InformationYearRow:=Find in array:C230(QV_al_ListQualityYears; $2)
								If ($_l_InformationYearRow>0)
									$_l_InformationYear:=Num:C11(QV_at_ListQualityYears{$_l_InformationYearRow})
									QUERY:C277([INFORMATION:55]; [INFORMATION:55]Year:5=$_l_InformationYear; *)
								Else 
									//something wrong!!
									QUERY:C277([INFORMATION:55]; [INFORMATION:55]Year:5=9999; *)
								End if 
							End if 
							
					End case 
					
				Else 
					QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityGroupID:15=Abs:C99($2); *)
				End if 
				QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]Deleted:10=0; *)
				QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelatedTableNumber:11=$_al_TableRange{$_l_Index})
				//this gives us all the records in the Qualities Table
				//we now have to get to the relevant table
				If (Records in selection:C76([INFORMATION:55])>0)
					$_Ptr_Table:=Table:C252([INFORMATION:55]RelatedTableNumber:11)
					$_ptr_Field:=Field:C253([INFORMATION:55]RelatedTableNumber:11; [INFORMATION:55]RelatedTableFieldNum:12)
					$_l_CountRecords:=Records in selection:C76([INFORMATION:55])
					CREATE EMPTY SET:C140($_Ptr_Table->; "TEMP")
					$_bo_ROState:=Read only state:C362($_Ptr_Table->)
					READ ONLY:C145($_Ptr_Table->)
					
					SELECTION TO ARRAY:C260([INFORMATION:55]RelateTableRecordNumber:13; $_al_RelatedRecordNumber)
					QUERY WITH ARRAY:C644($_ptr_Field->; $_al_RelatedRecordNumber)
					//now we have a set of records in the destination table
					//we have to put the set into the blob
					QV_SaveSet($_al_TableRange{$_l_Index})
					If ($_bo_ROState=False:C215)
						UNLOAD RECORD:C212($_Ptr_Table->)
						READ WRITE:C146($_Ptr_Table->)
					End if 
					
				End if 
				
			End if 
		End if 
		
	End for 
	
	
End if 
CLEAR SEMAPHORE:C144("$LinkingQualities")
ERR_MethodTrackerReturn("QV_UpdateSet"; $_t_oldMethodName)
