import React, { useState, useEffect } from 'react';
import { TableContainer, Table, TableHead, TableCell, TableRow, Paper, TextField } from "@material-ui/core";
import { makeStyles } from '@material-ui/core/styles';

const useStyles = makeStyles({
  table: {
    minWidth: 650,
    maxWidth: 800,
  },
});

const UserUI = props => {
  const classes = useStyles();

  return (
    <TableContainer component={Paper}>
      <Table className={classes.table}>
       <TableHead>
         <TableRow>
           <TableCell>First Name</TableCell>
           <TableCell>Last Name</TableCell>
           <TableCell>Gender</TableCell>
           <TableCell>Species</TableCell>
           <TableCell>Vehicle</TableCell>
           <TableCell>Weapon</TableCell>
         </TableRow>
       </TableHead>
       {
         props.users.map((user) => {
           return(
             <TableRow>
               <TableCell>{ user.first_name }</TableCell>
               <TableCell>{ user.last_name }</TableCell>
               <TableCell>{ user.gender }</TableCell>
               <TableCell>{ user.species }</TableCell>
               <TableCell>{ user.vehicle }</TableCell>
               <TableCell>{ user.weapon }</TableCell>
             </TableRow>
           )
         })
       }
      </Table>
     </TableContainer>
  )
}

export default UserUI;