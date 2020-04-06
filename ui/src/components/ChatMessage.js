import React from 'react';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import Avatar from '@material-ui/core/Avatar';
import Typography from '@material-ui/core/Typography';
import makeStyles from '@material-ui/core/styles/makeStyles';
import Popover from '@material-ui/core/Popover';

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
    popover: {
        pointerEvents: 'none',
    },
    paper: {
        padding: theme.spacing(1),
    },
}));

export const ChatMessage = ({user, message, isOwned}) => {
    const classes = useStyles();
    const [anchorEl, setAnchorEl] = React.useState(null);

    const handlePopoverOpen = (event) => {
        setAnchorEl(event.currentTarget);
    };

    const handlePopoverClose = () => {
        setAnchorEl(null);
    };

    const open = Boolean(anchorEl);

    return <Paper className={isOwned ? classes.leftMessage : classes.rightMessage}>
        <Grid container wrap="nowrap" spacing={2}>
            <Grid item>
                <Avatar
                    aria-owns={open ? 'mouse-over-popover' : undefined}
                    aria-haspopup="true"
                    onMouseEnter={handlePopoverOpen}
                    onMouseLeave={handlePopoverClose}
                >
                    {user[0]}
                </Avatar>
                <Popover
                    id="mouse-over-popover"
                    className={classes.popover}
                    classes={{
                        paper: classes.paper,
                    }}
                    open={open}
                    anchorEl={anchorEl}
                    anchorOrigin={{
                        vertical: 'bottom',
                        horizontal: 'left',
                    }}
                    transformOrigin={{
                        vertical: 'top',
                        horizontal: 'left',
                    }}
                    onClose={handlePopoverClose}
                    disableRestoreFocus
                >
                    <Typography>{user}</Typography>
                </Popover>
            </Grid>
            <Grid item xs>
                <Typography>{message}</Typography>
            </Grid>
        </Grid>
    </Paper>
};
