import React, { useEffect, useState } from 'react';
import { ActivityIndicator, Button, Text } from 'react-native';
// import generatedData from './generated.json';
import DefaultPreference from 'react-native-default-preference';
import now from 'performance-now';
import AsyncStorage from '@react-native-async-storage/async-storage';

const SharedPreferencesView = () => {
  const [time, setTime] = useState(0);
  const [loading, setLoading] = useState(false);

  const startTest = async () => {
    let t0 = now();
    setLoading(true);

    const generatedData = await import('./generated.json');

    const kvPairs = generatedData.map(kvObject => [
      kvObject.key,
      kvObject.value,
    ]);

    AsyncStorage.multiSet(kvPairs, error => console.log(error)).then(() => {
      setTime(now() - t0);
      setLoading(false);
    });
  };

  return (
    <>
      {loading ? (
        <ActivityIndicator />
      ) : (
        <>
          <Button
            title={'START TEST'}
            onPress={async () => await startTest()}
          />
          {time !== 0 ? (
            <>
              <Button
                title={'CLEAR MEMORY'}
                onPress={async () => {
                  setLoading(true);
                  setTime(0);
                  await DefaultPreference.clearAll();
                  await AsyncStorage.clear();
                  setLoading(false);
                }}
              />

              <Text>{`Stored ${generatedData.length} Key-Value Pairs in ${time} milliseconds`}</Text>
            </>
          ) : null}
        </>
      )}
    </>
  );
};

export default SharedPreferencesView;
