import React, { useState, useEffect } from 'react';
import Pagination from '@material-ui/lab/Pagination';
import { TextField } from "@material-ui/core";
import UserUI from './UserUI';

const User = props => {
  const [page, setPage] = useState(1);
  const [per, setPer] = useState(10);
  const [term, setTerm] = useState("");
  const [users, setUsers] = useState(props.users);
  const [totalCount, setTotalCount] = useState(100);
  
  const handleSearchChange = (e) => {
    setTerm(e.target.value);
  }

  const handlePageChange = (event, value) => {
    setPage(value);
  }

  const handleTotalCount = (value) => {
    setTotalCount(value);
  }

  useEffect(() => {
    const url = `/users/index.json?per=${per}&page=${page}&term=${term}`;
    fetch(url)
      .then(response => {
        return response.json();
      }).then(response => {
        setUsers(response.users);
        setTotalCount(response.total_count);
      });
  }, [term, per, page]);

  return ( <React.Fragment>
            <TextField onChange={handleSearchChange} label="Search"/>
            <UserUI users={users}/>
            <Pagination count={ Math.ceil(totalCount/per) } onChange={handlePageChange}/>
           </React.Fragment>
         )
}

export default User;
