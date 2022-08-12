//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_TransferPictures
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(EW_at_C01Codes;0)
	//ARRAY TEXT(EW_at_AllDocs;0)
	//ARRAY TEXT(EW_at_FolderPathName;0)
	//ARRAY TEXT(EW_at_PicPathNames;0)
	//ARRAY TEXT(EW_at_PicPathShortNames;0)
	//ARRAY TEXT(EW_at_PicturePath;0)
	C_BLOB:C604($_blb_PictureBLB; EW_PictureBLOB)
	C_BOOLEAN:C305(<>PictureChecked; $_bo_HavePic; $_bo_Initialising; $_bo_PictureChecked; ycontinue; yHasPics; yInitialising)
	C_LONGINT:C283($_l_CharacterPosition; $_l_Error; $_l_PathsIndex; $_l_Process; $_l_Timeout)
	C_REAL:C285($_r_Ticks; EW_iThermcount)
	C_TEXT:C284($_t_Module; $_t_oldMethodName; $_t_Options; $_t_Path; $_t_picnameWithExtension; $_t_Query; tlocalFolderPath; tPicname)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_TransferPictures")

// EW_TransferPictures
// For transferring the Item pictures to the BK
// 11/10/03 pb
// 05/03/04 pb - fixed problem whereby it did not find
//     the pics when in single-user

$_l_Process:=0

If (yHasPics) & ([EW_ExportProjects:117]BKUpdatePictures:33)  // Product export for BK; there are pics to send
	SET_THERMOMETER("Transferring images to the Business Kit …"; EW_iThermcount)
	ARRAY TEXT:C222(EW_at_PicPathNames; 0)
	$_l_Timeout:=0
	If (Application type:C494=4D Remote mode:K5:5)
		$_l_Process:=Execute on server:C373("PictureOnServerToBLOB"; 64000; "Picture Into BLOB")  // EW_at_FolderPathName is list of all possible pic folders on server
		DelayTicks(30)
		VARIABLE TO VARIABLE:C635($_l_Process; EW_at_FolderPathName; EW_at_FolderPathName)  // EW_at_PicturePath
		$_bo_Initialising:=True:C214
		While ($_bo_Initialising) & ($_l_Timeout<300)
			DelayTicks(30)
			GET PROCESS VARIABLE:C371($_l_Process; yInitialising; $_bo_Initialising)
			$_l_Timeout:=$_l_Timeout+1
		End while 
		ARRAY TEXT:C222(EW_at_PicPathShortNames; 0)  // 5/03/04 pb
		GET PROCESS VARIABLE:C371($_l_Process; EW_at_PicPathShortNames; EW_at_PicPathShortNames)
		GET PROCESS VARIABLE:C371($_l_Process; EW_at_AllDocs; EW_at_PicPathNames)
	Else 
		DOCUMENT LIST:C474(tlocalFolderPath; EW_at_PicPathNames)
		ARRAY TEXT:C222(EW_at_PicPathShortNames; Size of array:C274(EW_at_PicPathNames))  // 5/03/04 pb
		For ($_l_PathsIndex; 1; Size of array:C274(EW_at_PicPathNames))
			$_l_CharacterPosition:=Position:C15("."; EW_at_PicPathNames{$_l_PathsIndex})
			If ($_l_CharacterPosition>0)
				EW_at_PicPathShortNames{$_l_PathsIndex}:=DocNameFromPath(Substring:C12(EW_at_PicPathNames{$_l_PathsIndex}; 1; $_l_CharacterPosition-1))
			Else 
				EW_at_PicPathShortNames{$_l_PathsIndex}:=DocNameFromPath(EW_at_PicPathNames{$_l_PathsIndex})
			End if 
		End for 
	End if 
	
	If ($_l_Timeout>299)
		// there must be a problem on the server
	Else 
		If (False:C215)  // 5/03/04 pb
			ARRAY TEXT:C222(EW_at_PicPathShortNames; 0)
			GET PROCESS VARIABLE:C371($_l_Process; EW_at_PicPathShortNames; EW_at_PicPathShortNames)
			GET PROCESS VARIABLE:C371($_l_Process; EW_at_AllDocs; EW_at_PicPathNames)
		End if 
		For ($_l_PathsIndex; 1; Size of array:C274(EW_at_PicturePath))
			$_bo_HavePic:=False:C215
			If (EW_at_PicturePath{$_l_PathsIndex}#"")
				$_t_Path:=tlocalFolderPath+EW_at_PicturePath{$_l_PathsIndex}
				If (Test path name:C476($_t_Path)=Is a document:K24:1)
					// okey dokey, we already have it
					$_bo_HavePic:=True:C214
				Else 
					If (Find in array:C230(EW_at_PicPathShortNames; EW_at_PicturePath{$_l_PathsIndex})>0)
						// the picture does exist
						// copy the pictures to the local computer, if necessary
						$_t_picnameWithExtension:=EW_at_PicPathNames{Find in array:C230(EW_at_PicPathShortNames; EW_at_PicturePath{$_l_PathsIndex})}
						// see if we can find it and copy it over
						// but only if we are in multi-user
						If (Application type:C494=4D Remote mode:K5:5)
							//     $path2:=EW_at_FolderPathName{$_l_PathsIndex}+$_t_picnameWithExtension
							SET BLOB SIZE:C606($_blb_PictureBLB; 0)
							SET PROCESS VARIABLE:C370($_l_Process; tPicname; $_t_picnameWithExtension)
							$_r_Ticks:=Tickcount:C458
							$_bo_PictureChecked:=False:C215
							OK:=0
							Error:=0
							Repeat 
								DelayTicks(30)
								
								GET PROCESS VARIABLE:C371($_l_Process; <>PictureChecked; $_bo_PictureChecked)
								If ($_bo_PictureChecked)
									GET PROCESS VARIABLE:C371($_l_Process; EW_PictureBLOB; $_blb_PictureBLB)
									If (BLOB size:C605($_blb_PictureBLB)>0)
										If (Test path name:C476($_t_Path)#Is a document:K24:1)
											$_ti_DocumentRef:=DB_CreateDocument($_t_Path)
											CLOSE DOCUMENT:C267($_ti_DocumentRef)
										End if 
										BLOB TO DOCUMENT:C526($_t_Path; $_blb_PictureBLB)
										$_bo_HavePic:=True:C214
									End if   // blob size > 0
								End if 
								
							Until ((Error#0) | ($_bo_PictureChecked) | ((Tickcount:C458-$_r_Ticks)>2800) | (OK=1))
							SET BLOB SIZE:C606(EW_PictureBLOB; 0)
						Else   //must be single-user
							$_t_Path:=tlocalFolderPath+$_t_picnameWithExtension  // 05/03/04 pb
							If (Test path name:C476($_t_Path)=Is a document:K24:1)
								$_bo_HavePic:=True:C214
							End if 
						End if   // 4d client
					End if 
				End if   // does the pic exist?
				
				If ($_bo_HavePic)
					If (Position:C15("_2."; $_t_Path)>0)  // it is View no. 2
						$_t_Module:="P02"
					Else 
						$_t_Module:="P01"
					End if 
					//       $_t_Query:=$_t_Path
					$_t_Query:=EW_at_C01Codes{$_l_PathsIndex}  // the C01 code
					$_t_Options:="TI"
					$_l_Error:=0
					//$_l_Error:=4DBKC_ExportFileTo4DBK ([EW_ExportProjects]BKIPAddress;[EW_ExportProjects]BKServerPort;[EW_ExportProjects]BKTimeout;[EW_ExportProjects]BKMaxDuration;[EW_ExportProjects]BKPassword;[EW_ExportProjects]BKStoreCode;$_t_Module;$_t_Query;$_t_Path;$_t_Options)
				End if 
				
			End if   // there is a pic name in this array element
		End for 
		//  ARRAY TEXT(EW_atItemCodes;0)
		ARRAY TEXT:C222(EW_at_PicturePath; 0)
	End if 
End if 
If ($_l_Process#0)
	SET PROCESS VARIABLE:C370($_l_Process; ycontinue; False:C215)  // this will end the PictureOnServerToBlob process
End if 
ERR_MethodTrackerReturn("EW_TransferPictures"; $_t_oldMethodName)