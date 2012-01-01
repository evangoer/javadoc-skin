YUI.add('javadoc-skin', function (Y) {
    //Y.one('.api').load('deprecated-list.html', 'table');

    //Y.one('.api').load('overview-summary.html', 'table');

    Y.one('.packages').load('overview-frame.html', 'table');
    Y.one('.classes').load('allclasses-frame.html', 'font.FrameItemFont');
    Y.one('head').append('<base href="org/apache/zookeeper/server/SessionTrackerImpl.html">')
    Y.one('.api').load('SessionTrackerImpl.html');  
}, '0.1', { requires: ['node-load'] });