import React from 'react';
import makeStyles from '@material-ui/core/styles/makeStyles';
import Button from '@material-ui/core/Button';
import Grid from '@material-ui/core/Grid';
import TextField from '@material-ui/core/TextField';

const useStyles = makeStyles((theme) => ({
    fixedFooter: {
        background: 'white',
        bottom: `${theme.spacing(1)}px`,
        right: `${theme.spacing(1)}px`,
        left: `${theme.spacing(1)}px`,
        position: 'fixed',
        width: `calc(100% - ${theme.spacing(2)}px)`,
        height: `${theme.spacing(12)}px`,
    },
    sendButton: {
        height: `${theme.spacing(12)}px`,
    }
}));

export const ChatInputBox = () => {
    const classes = useStyles();
    return <Grid className={classes.fixedFooter} alignItems='center' container>
        <Grid item xs={10}>
            <TextField label="Wanna say something..." variant="outlined" fullWidth={true} multiline={true} rows={3}/>
        </Grid>
        <Grid item xs={2}>
            <Button className={classes.sendButton} variant="contained" color="primary" fullWidth={true}>
                Send
            </Button>
        </Grid>
    </Grid>;
};
