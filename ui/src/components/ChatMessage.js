import React from 'react';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import Avatar from '@material-ui/core/Avatar';
import Typography from '@material-ui/core/Typography';
import makeStyles from '@material-ui/core/styles/makeStyles';

const useStyles = makeStyles((theme) => ({
    rightMessage: {
        margin: `${theme.spacing(2)}px 27% 0 3%`,
        padding: theme.spacing(2),
        width: `70%`,
    },
    leftMessage: {
        margin: `${theme.spacing(2)}px 3% 0 27%`,
        padding: theme.spacing(2),
        width: `70%`,
    },
}));

export const ChatMessage = ({user, message, isOwned}) => {
    const classes = useStyles();
    return <Paper className={isOwned ? classes.leftMessage : classes.rightMessage}>
        <Grid container wrap="nowrap" spacing={2}>
            <Grid item>
                <Avatar>{user[0]}</Avatar>
            </Grid>
            <Grid item xs>
                <Typography>{message}</Typography>
            </Grid>
        </Grid>
    </Paper>
};
